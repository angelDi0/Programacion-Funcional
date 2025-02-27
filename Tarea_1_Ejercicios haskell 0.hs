import GHC.Read (list)
-- 1.- Suma de los elementos de una lista *
sumaList :: [Int] -> Int 
sumaList [] = 0
sumaList (x:xs) = x + sumaList xs

-- 2.- Factorial
factorial :: Int -> Int
factorial 0 = 1
factorial (x) = x * factorial (x-1)

-- 3.- Numero de Pares *
numerosPares :: Int -> [Int]
numerosPares n = filter even [1..n]

-- 4. Longitud de una cadena
longitudCadena :: [Int] -> Int
longitudCadena [] = 0
longitudCadena (x:xs) = 1 + longitudCadena(xs)

-- 5.- Reverso de una lista
reversoLista :: [Int] -> [Int]
reversoLista [] = []
reversoLista (x:xs) = reversoLista (xs) ++ [x]

-- 6.- Duplicar elementos *
duplicarElementos :: [Int] -> [Int]
duplicarElementos = concatMap (\x -> [x, x])

-- 7.- Filtrar los elementos pares de una lista *
filtrarPares :: [Int] -> [Int]
filtrarPares = filter odd

-- 8.- Fibonacci
numeroFibonacci :: Int -> Int
numeroFibonacci 0 = 1
numeroFibonacci 1 = 1
numeroFibonacci x = numeroFibonacci (x - 1) + numeroFibonacci(x - 2)

-- 9.- Todos los divisores de un numero n
divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0 ]

-- 10.- Verificar si la palabra es un palindromo
esPalindromo :: String -> Bool
esPalindromo s = s == reversearPalabra s

reversearPalabra :: String -> String
reversearPalabra [] = []
reversearPalabra (x:xs) = reversearPalabra xs ++ [x]
