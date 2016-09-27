def test_aliases_file(File):
    conf = File('/etc/aliases')
    assert conf.contains('^alias1: user1$')
    assert conf.contains('^group: user1, user2$')
    assert not conf.contains('^remove1:.*$')
    assert not conf.contains('^remove2:.*$')
