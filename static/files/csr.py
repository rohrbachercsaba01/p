from cryptography import x509
from cryptography.x509.oid import NameOID
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization
import os

# User input for registration number
#regnumold = input("Regisztracios szam: ")

def generateCSR(regnum):

    # Generate RSA Key 23002425
    key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=4096,
    )

    # Save the key to a file
    key_filename = os.path.join('generated_files', f"{regnum}.key")

    with open(key_filename, "wb") as key_file:
        key_file.write(
            key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.TraditionalOpenSSL,
                encryption_algorithm=serialization.NoEncryption()
            )
        )
    print(f"Key file generated: {key_filename}")

    # Generate CSR
    csr = x509.CertificateSigningRequestBuilder().subject_name(x509.Name([
        x509.NameAttribute(NameOID.COMMON_NAME, regnum),
    ])).add_extension(
        x509.KeyUsage(digital_signature=True, content_commitment=True, key_encipherment=False, data_encipherment=False, key_agreement=False, key_cert_sign=False, crl_sign=False, encipher_only=False, decipher_only=False),
        critical=True,
    ).sign(key, hashes.SHA256())

    # Save the CSR to a file
    csr_filename = os.path.join('generated_files', f"{regnum}.csr")

    with open(csr_filename, "wb") as csr_file:
        csr_file.write(csr.public_bytes(serialization.Encoding.PEM))
    print(f"CSR file generated: {csr_filename}")



    return key_filename, csr_filename

