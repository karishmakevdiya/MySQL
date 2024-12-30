-- Data Cleaning
/*
data cleaning is basically where you get it in moew usable format so you fix a
lot of issues in the row data when you start creating visualizations or start using 
it in your products that the datais actually usefull and aren't a lot of issues with it
*/

select *
from layoffs;

-- 1. remove duplicates
-- 2. standardize the data
-- 3. null values or blank values
-- 4. remove any columns 

create table layoffs_staging
like layoffs;  /* create table with same columns as layoffs */

select *
from layoffs_staging;

insert layoffs_staging /*insert all the data from layoffs to layoffs_staging just to have a backup of raw data*/
select * 
from layoffs;

/* giving a row number to find out duplicates if there is a multiple if row num is grater than 1 means there is a duplicate*/
select *,
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from layoffs_staging;


/* create cte to select duplicate records */
with duplicate_cte AS 
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) row_num
from layoffs_staging
)
select * 
from duplicate_cte
where row_num > 1;

/*check the duplicate record (this is just to double check the result)*/

select *
from layoffs_staging
where company = 'Casper'
;

/* remove duplicate data */
with duplicate_cte AS 
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) row_num
from layoffs_staging
)
DELETE 
from duplicate_cte
where row_num > 1; /*this is not working becase we can not update/delete cte*/


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2
;

insert into layoffs_staging2
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) as row_num
from layoffs_staging;

delete
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2
where row_num > 1
;

select *
from layoffs_staging2;

-- standardizing data

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company); 

select industry
from layoffs_staging2;

select distinct industry
from layoffs_staging2 order by 1; /* 1 means first column   */

select *
from layoffs_staging2 
where industry like 'Crypto%'; 

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%'; 

select *
from layoffs_staging2;

select distinct location
from layoffs_staging2 order by 1;

select distinct country
from layoffs_staging2 order by 1;

select *
from layoffs_staging2
WHERE COUNTRY LIKE 'United States%'
 order by 1;
 
 select distinct country, Trim(trailing '.' from country)
from layoffs_staging2 order by 1;
 
 update layoffs_staging2
set country = Trim(trailing '.' from country)
where country like 'United States%'; 

select `date`, /*using date with `` sign because date is also a keyword in mysql*/
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select `date`
from layoffs_staging2;

/*change datatype of date column text to date*/

alter table layoffs_staging2 
modify column `date` date;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

update layoffs_staging2
set industry = null
where industry = '';

select *
from layoffs_staging2
where industry is null
or industry = '';

select *
from layoffs_staging2
where company = 'Airbnb';

select t1.industry, t2.industry 
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company    
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null or t1.industry = '')
and t2.industry is not null    
;

select *
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

-- delete rows 

delete
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;

select *
from layoffs_staging2;