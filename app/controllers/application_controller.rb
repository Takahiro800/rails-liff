class ApplicationController < ActionController::Base
  before_action :setting_env_js


  private
  # LINEIDを環境変数としてJSに渡すためのもの
  def setting_env_js
    gon.LIFF_ID_key = ENV['LIFF_ID']
  end
end
