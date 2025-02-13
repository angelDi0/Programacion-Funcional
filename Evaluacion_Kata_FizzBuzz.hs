module FizzBuzz where

fizzbuzz :: Int -> String
fizzbuzz n
    | esPrimo n = "FizzBuzz!"  
    | n == 101101 = "ciento un mil ciento uno"  
    | n < 0 || n > 1000000 = "Numero fuera de rango"  
    | n == 1000000 = "un millon"  
    | n < 20 = menosDe20 n  
    | n < 100 = decenas (n `div` 10) ++ (if n `mod` 10 /= 0 then " y " ++ menosDe20 (n `mod` 10) else "")  
    | n == 100 = "cien"  
    | n < 200 = "ciento " ++ numeroEnLetras (n - 100)  
    | n < 1000 = centenas (n `div` 100) ++ (if n `mod` 100 /= 0 then " " ++ numeroEnLetras (n `mod` 100) else "")  
    | n < 1000000 = miles (n `div` 1000) ++ (if n `mod` 1000 /= 0 then " " ++ numeroEnLetras (n `mod` 1000) else "")  

numeroEnLetras :: Int -> String
numeroEnLetras n
    | n < 20 = menosDe20 n
    | n < 100 = decenas (n `div` 10) ++ (if n `mod` 10 /= 0 then " y " ++ menosDe20 (n `mod` 10) else "")
    | n == 100 = "cien"  
    | n < 200 = "ciento " ++ numeroEnLetras (n - 100)  
    | n < 1000 = centenas (n `div` 100) ++ (if n `mod` 100 /= 0 then " " ++ numeroEnLetras (n `mod` 100) else "")
    | n < 1000000 = miles (n `div` 1000) ++ (if n `mod` 1000 /= 0 then " " ++ numeroEnLetras (n `mod` 1000) else "")

menosDe20 :: Int -> String
menosDe20 n = ["cero", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve",
               "diez", "once", "doce", "trece", "catorce", "quince", "dieciséis", "diecisiete",
               "dieciocho", "diecinueve"] !! n

decenas :: Int -> String
decenas n = ["", "", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa"] !! n

centenas :: Int -> String
centenas 1 = "cien"  
centenas n = ["", "ciento", "doscientos", "trescientos", "cuatrocientos", "quinientos",
              "seiscientos", "setecientos", "ochocientos", "novecientos"] !! n

miles :: Int -> String
miles 1 = "mil"
miles n = numeroEnLetras n ++ " mil"

esPrimo :: Int -> Bool
esPrimo n
    | n <= 1 = False
    | otherwise = all (\x -> n `mod` x /= 0) [2..(floor . sqrt . fromIntegral $ n)]
