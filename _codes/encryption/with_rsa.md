1. **Generate RSA Key Pair:**
   - Import OpenSSL library.
   - Generate a 2048-bit RSA private key.
   - Derive the corresponding public key.

2. **Encrypt Data with RSA:**
   - Use the RSA public key to encrypt the string 'Ruby'.
   - Produce encrypted data (`enc_data`).

3. **Decrypt Data with RSA:**
   - Employ the RSA private key to decrypt the previously encrypted data (`enc_data`).
   - Retrieve the original string ('Ruby').

These snippets showcase RSA key generation, encryption, and decryption using the OpenSSL library in Ruby.
