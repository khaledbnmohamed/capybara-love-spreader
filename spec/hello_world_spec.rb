require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
  describe 'index page', driver: :selenium_chrome_headless, js: true do
    it 'shows the right content' do
      Capybara.current_driver = Capybara.javascript_driver
      visit 'https://ask.fm/khaledbnmohamed'
      lines = File.readlines('test.txt')
      lines.each do |line|
        page.find(:css,'#question_question_text', match: :first).set(line.strip)
        sleep(0.5)
        page.find(:xpath, "//label[@for='single_question_terms_accepted']").click
        page.find(:xpath, "//label[@for='single_question_privacy_accepted']").click

        within('.optionsBar-buttonWrap') do
          page.find(:button, match: :first).click
        end
        sleep(3)
        page.find(class: 'lightbox_close', match: :first).click
        sleep(4)

      end

    end
  end
end


