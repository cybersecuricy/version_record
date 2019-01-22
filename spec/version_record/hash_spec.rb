describe Hash do
  describe '#to_version' do
    it { expect({ major: 2, minor: 2, patch: 1 }.to_version).to eq VersionRecord::Version.new('2.2.1') }
    it { expect({ 'major' => 2, 'minor' => 2, 'patch' => 1 }.to_version).to eq VersionRecord::Version.new('2.2.1') }
    it { expect({ major: 2, minor: 2, patch: 1, prerelease: 'foo' }.to_version).to eq VersionRecord::Version.new('2.2.1.foo') }
  end
end
