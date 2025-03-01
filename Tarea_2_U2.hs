import Data.List (genericLength)
import Data.Char (toUpper)
import qualified Data.Map as Map


-- 1) Aplicar descuentos e IVA a una lista de productos
descuento :: Double -> Double -> Double
descuento porcentaje precio = precio * (1 - porcentaje / 100)

aplicarIVA :: Double -> Double -> Double
aplicarIVA porcentaje precio = precio * (1 + porcentaje / 100)

aplicarCesta :: (Double -> Double -> Double) -> Map.Map String (Double, Double) -> Double
aplicarCesta f cesta = sum [f porcentaje precio | (_, (precio, porcentaje)) <- Map.toList cesta]


-- 2) Aplicar una función a una lista
aplicarFuncionLista :: (a -> b) -> [a] -> [b]
aplicarFuncionLista f lista = map f lista


-- 3) Diccionario de palabras con su longitud
contarPalabras :: String -> Map.Map String Int
contarPalabras frase = Map.fromList [(palabra, length palabra) | palabra <- words frase]


-- 4) Convertir calificaciones 
convertirNotas :: Map.Map String Double -> Map.Map String String
convertirNotas notas = Map.mapKeys (map toUpper) $ Map.map calificacion notas
  where
    calificacion n
      | n >= 95   = "Excelente"
      | n >= 85   = "Notable"
      | n >= 75   = "Bueno"
      | n >= 70   = "Suficiente"
      | n < 70 = "Desempeño insuficiente"

-- 5) Calcular el módulo de un vector
moduloVector :: [Double] -> Double
moduloVector v = sqrt $ sum [x^2 | x <- v]

-- 6) Detectar los valores atípicos de una lista 

media :: [Double] -> Double
media xs = sum xs / fromIntegral (length xs)

desviacionEstandar :: [Double] -> Double
desviacionEstandar xs = sqrt (sum [(x - m) ^ 2 | x <- xs] / fromIntegral (length xs))
  where m = media xs

detectarAtipicos :: [Double] -> [Double]
detectarAtipicos xs = 
  if sd == 0 then []  
  else [x | x <- xs, let z = abs (x - m) / sd, z > 1.5]  
  where
    m = media xs
    sd = desviacionEstandar xs