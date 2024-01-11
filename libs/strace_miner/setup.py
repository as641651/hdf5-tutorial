from setuptools import setup, find_packages

with open("README.md", "r") as f:
    long_description = f.read()

setup(
    name='strace_miner',
    version="0.1",
    description="A Tool kit to analyze strace logs",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url='',
    author='Aravind Sankaran',
    author_email='a.sankaran@fz-juelich.de',
    packages= find_packages(), # finds packages inside current directory
    classifiers=[
        "Programming Language :: Python :: 3",
    ],
    python_requires=">3",

)