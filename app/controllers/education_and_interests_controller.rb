class EducationAndInterestsController < ApplicationController
  
  before_filter :prepare_user

  def index
    prepare_build_relation
  end

  def create
    success = @user.update_attributes(params[:user])
    if success
      validate_language_and_availability
      flash[:success] = "Education and Interesets saved"
    else
      flash[:error] = @user.errors.full_messages
    end
    redirect_to :action => :index
  end

  def language_lists
    keywords  = params[:term].split(",")
    keyword   = keywords.last.strip
    result    = []
    Language::LIST_OF_LANGUAGE.each do |l| 
      result << {:label => l[0], :value => l[1]} if !already_present_in(keywords, l[0])
    end
    render :json => result.compact
  end

  private

  def validate_language_and_availability
    validate_availability_params(params[:user][:availabilities_attributes])
    validate_language_params(params[:user][:languages_attributes])
  end
 
  def validate_availability_params(params)
    new_avails = params.map{|h| combine_hour_params(h[1])}
    current_avails = @user.availabilities.map{|a| {:id => a.id, :hour => "#{a.start_hour}#{a.end_hour}#{a.day_of_week}"}}    
    current_avails.each do |a|
      Availability.find(a[:id]).delete if !new_avails.include?(a[:hour])
    end
  end

  def validate_language_params(params)
    new_lang = params.map{|l| l[1][:language]}
    current_lang = @user.languages.map{|l| {:id => l.id, :lang => l.language}}
    current_lang.each do |l|
      Language.find(l[:id]).delete if !new_lang.include?(l[:lang])
    end
  end

  def combine_hour_params(p)
    arr = p.map{|a| a[1] if a[0] != "id"}.compact
    arr.join()
  end

  def prepare_user
    @user = current_user
  end
  
  def prepare_build_relation
    @user.availabilities.build   if @user.availabilities.blank?
    @user.build_education   if @user.education.blank?    
    @user.languages.build   if @user.languages.blank?
    @user.build_user_detail if @user.user_detail.blank?
  end

  def already_present_in(array, value)
    array.map{|k| k.strip}.include?(value)
  end
end