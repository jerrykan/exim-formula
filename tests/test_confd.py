def test_confd_macros(File):
    conf = File('/etc/exim4/conf.d/main/10_local-config_localoptions')
    assert conf.contains('^DUMMY_VALUE = true$')

def test_confd_router(File):
    conf = File('/etc/exim4/conf.d/router/880_local-config_redirect_domain')
    assert conf.contains('^redirect_domain:$')
    assert conf.contains('^  driver = redirect$')
    assert conf.contains('^  domains = mail.example.org : mail.example.com$')
    assert conf.contains('^  data = $local_part@example.com$')
