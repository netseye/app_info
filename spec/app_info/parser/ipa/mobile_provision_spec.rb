describe AppInfo::Parser::MobileProvision do
  let(:file) { File.dirname(__FILE__) + '/../../../fixtures/apps/ipad.ipa' }
  let(:ipa) { AppInfo::Parser::IPA.new(file) }
  subject { AppInfo::Parser::MobileProvision.new(ipa.mobileprovision_path) }

  if AppInfo::Parser.mac?
    it { expect(subject.devices).to be_nil }
    it { expect(subject.team_name).to eq('QYER Inc') }
    it { expect(subject.profile_name).to eq('XC: *') }
    it { expect(subject.expired_date).not_to be_nil }
    it { expect(subject.empty?).to be false }
    it { expect(subject.mobileprovision).to be_kind_of Hash }
  end
end
