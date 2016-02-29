DEPLOY_BUCKET=analytics.phila.gov/testdata

production:
	bundle exec jekyll build

dev:
	bundle exec jekyll serve --watch --config=_config.yml,_development.yml

deploy:
	make production && s3cmd put --recursive -P -M --add-header="Cache-Control:max-age=0" _site/* s3://$(DEPLOY_BUCKET)/ && s3cmd put -P --mime-type="text/css" --add-header="Cache-Control:max-age=0" _site/css/*.css s3://$(DEPLOY_BUCKET)/css/

