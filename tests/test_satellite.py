def test_satellite_conf_file(File):
    conf = File('/etc/exim4/update-exim4.conf.conf')
    assert conf.contains("^dc_eximconfig_configtype='satellite'$")
    assert conf.contains("^dc_smarthost='mail.internal.example.com'$")
    assert conf.contains("^dc_use_split_config='true'$")
