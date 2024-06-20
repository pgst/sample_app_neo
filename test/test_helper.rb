ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!
include ApplicationHelper

module ActiveSupport
  class TestCase
    # 指定されたワーカーでテストを並列実行する
    parallelize(workers: :number_of_processors)

    # すべてのテストに対して、test/fixtures/*.yml内の
    # すべてのフィクスチャをアルファベット順にセットアップ
    fixtures :all

    # テストユーザーがログインしていればtrueを返す
    def is_logged_in?
      !session[:user_id].nil?
    end
  end
end
