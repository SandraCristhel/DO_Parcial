use Kaggle
go


--Crear Tabla
if not exists (select * from SYS.TABLES WHERE Object_id=OBJECT_ID(N'dbo.starbucks') AND TYPE ='U')
CREATE TABLE dbo.starbucks (
                     beverage_category VARCHAR(50),
                     beverage VARCHAR(100),
                     beverage_prep VARCHAR(50),
                     calories DECIMAL(6,3),
                     total_fat_g VARCHAR(10),
                     trans_fat_g DECIMAL(6,3),
                     saturated_fat_g DECIMAL(6,3),
                     sodium_mg DECIMAL(6,3),
                     total_carbohydrates_g DECIMAL(6,3),
                     dietary_fibre_g DECIMAL(6,3),
                     sugars_g DECIMAL(6,3),
                     protein_g DECIMAL(6,3),
                     vitamin_a_pct VARCHAR(10),
                     vitamin_c_pct VARCHAR(10),
                     calcium_pct VARCHAR(10),
                     iron_pct VARCHAR(10),
                     caffeine_mg VARCHAR(10)
  )
  GO

  --SI YA EXISTE LA TABLA dbo.starbucks LA LIMPIA
  TRUNCATE TABLE dbo.starbucks;
  GO

  --IMPORTAR DATA DESDE ARCHIVO
  BULK INSERT dbo.starbucks
  FROM 'C:\Users\sancp\OneDrive\Documentos\Proyecto_Parcial\Dataset\starbucks.csv'
  WITH 
  (
      FIRSTROW = 2, --EMPIEZA EN LA 2DA FILA
	  FIELDTERMINATOR = ',', --INDICAMOS SEPARADOR DE COLUMNAS
	  ROWTERMINATOR = '0x0a' ---HACE REFERENCIA A UN SALTO DE LINEA

)
GO

SELECT * from dbo.starbucks
GO
