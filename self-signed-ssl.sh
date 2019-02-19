#!/bin/ash

PASSWD=notsecure01

openssl req \
    -new \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=US/ST=IL/L=Springfield/O=Self/CN=localhost" \
    -keyout jenkins.key \
    -out jenkins.cert

# Create a PKCS12 file with the cert and the key

openssl pkcs12 -export -out jenkins.pfx -inkey jenkins.key -in jenkins.cert -passout pass:${PASSWD}

# Bundle this into a keystore

keytool -importkeystore -srckeystore jenkins.pfx -srcstoretype pkcs12 -destkeystore jenkins.jks -deststoretype JKS -storepass ${PASSWD} -srcstorepass ${PASSWD}
