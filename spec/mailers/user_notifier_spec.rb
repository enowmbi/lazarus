require "rails_helper"

 RSpec.describe UserNotifierMailer, type: :mailer do
  describe "forgot_password" do
    let(:mail) { UserNotifierMailer.forgot_password }

    it "renders the headers" do
      expect(mail.subject).to eq("Forgot password")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "get_domain" do
    let(:mail) { UserNotifierMailer.get_domain }

    it "renders the headers" do
      expect(mail.subject).to eq("Get domain")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
