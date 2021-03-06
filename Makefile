DOCS=docs

.PHONY: docs tests

docs:
	cd $(DOCS) && $(MAKE) clean && $(MAKE) html

docs-online: docs
	ghp-import -np $(DOCS)/_build/html -r origin

tests:
	py.test tests

clean:
	rm -rf dist
	rm acoustics/*.c
	rm acoustics/*.so
	find . -name __pycache__ | xargs rm -rf {}
	find . -name "*.pyc" | xargs rm -rf {}
	rm -rf acoustics.egg-info
	rm -rf build
	rm -rf .pytest_cache


sdist:
	python3 setup.py sdist

release: docs-online
	python3 setup.py sdist upload

