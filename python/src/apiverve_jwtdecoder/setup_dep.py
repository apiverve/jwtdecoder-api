from setuptools import setup, find_packages

setup(
    name='apiverve_jwtdecoder',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='JWT Decoder decodes JWT tokens to reveal header and payload information without performing signature verification. It handles JSON web token decode from any language over REST, so you can inspect claims and expiry without adding a JWT library.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/jwtdecoder?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
