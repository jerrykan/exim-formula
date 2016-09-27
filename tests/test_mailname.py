def test_aliases_file(File):
    conf = File('/etc/mailname')
    assert conf.content == 'otherhost.example.com\n'
