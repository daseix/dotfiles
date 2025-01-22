#!/bin/bash

oathtool -b --totp `keyring -b keyring.backends.libsecret.Keyring get otp seid_da`

#oathtool -b --totp `python3 -c "import keyring; print(keyring.get_credential(\"RMC\", None).password)"`

# import keyring
# # keyring.set_password("RMC", "seid_da", secret)
# cr = keyring.get_credential("RMC", None)
# if cr is not None:
    # print("Username:", cr.username)
    # print("Password:", cr.password)
