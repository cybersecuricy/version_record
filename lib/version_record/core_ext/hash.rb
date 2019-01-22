class Hash
  def to_version
    stringified = stringify_keys

    string = [
      stringified.fetch('major', 0),
      stringified.fetch('minor', 0),
      stringified.fetch('patch', 0)
    ].map(&:to_s).compact.join('.')

    prerelease = stringified['prerelease']

    string << ".#{prerelease}" if prerelease

    VersionRecord::Version.new(string)
  end
end
