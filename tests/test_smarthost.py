def test_smarthost_conf_file(File):
    conf = File('/etc/exim4/update-exim4.conf.conf')
    assert conf.contains("^dc_eximconfig_configtype='smarthost'$")
    assert conf.contains("^dc_local_interfaces=''$")
    assert conf.contains(
        "^dc_smarthost='mail1.external.example.com ;"
        " mail2.external.example.com'$")
    assert conf.contains("^dc_use_split_config='false'$")
