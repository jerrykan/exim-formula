exim:
  config:
    use_split_config: True

  confd:
    main:
      10_local-config_localoptions: |
        DUMMY_VALUE = true

    router:
      880_local-config_redirect_domain: |
        redirect_domain:
          driver = redirect
          domains = mail.example.org : mail.example.com
          data = $local_part@example.com
