.PHONY: run clean

VENV = .venv
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip

$(VENV)/bin/activate: requirements.txt
	@echo ""; echo "Creating a new virtual environment..."
	python3 -m venv $(VENV)
	@echo "Upgrading pip..."
	$(PIP) install --upgrade pip
	@echo "Installing requirements..."
	$(PIP) install -r requirements.txt
	touch $(VENV)/bin/activate

venv: clean requirements.txt
	@echo ""; echo "Creating a new virtual environment..."
	python3 -m venv $(VENV)
	@echo "Upgrading pip..."
	$(PIP) install --upgrade pip
	@echo "Installing requirements..."
	$(PIP) install -r requirements.txt
	touch $(VENV)/bin/activate

run: $(VENV)/bin/activate
	@echo ""; echo "Running the program..."
	$(PYTHON) src/main.py

clean:
	@echo ""; echo "Cleaning..."
	rm -rf ./src/__pycache__
	rm -rf $(VENV)
