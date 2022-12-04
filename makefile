report.html: report.Rmd Data/cleandataframe.rds Output/SummaryTable.rds Output/KaplanPlot.jpg
	Rscript Programs/03renderingreport.R

Data/cleandataframe.rds: Programs/01Bringing_in_dataset.R Data/heart_failure_clinical_records_dataset.csv
	Rscript Programs/01Bringing_in_dataset.R 

Output/SummaryTable.rds Output/KaplanPlot.jpg &: Programs/02CreatingProducts.R Data/cleandataframe.rds
	Rscript Programs/02CreatingProducts.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f Output/*.rds && rm -f report.html && rm -f Output/*.jpg

build:
	docker build -t logangerig/final_image

pull:
	docker pull logangerig/final_image
	
project:
	docker run -v "/$$(pwd)/Report":/Info550Project/Report logangerig/final_image