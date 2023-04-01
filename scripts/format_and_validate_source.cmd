@echo off

pushd ..

echo.
echo Activate virtual environment
call venv\Scripts\activate.bat

echo.
echo Install linter requirements
pip install -r requirements.linter.txt

echo.
echo Format using isort
isort testlog --sp=.isort.cfg
isort tests --sp=.isort.cfg

echo.
echo Format using black
black -q testlog --config=pyproject.toml
black -q tests --config=pyproject.toml

echo.
echo Validate using flake8
flake8 testlog --config=.flake8
flake8 tests --config=.flake8

echo.
echo Exit without deactivating virtual environment

popd
