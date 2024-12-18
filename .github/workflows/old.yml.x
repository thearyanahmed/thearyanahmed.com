name: Deploy Hugo Site

on:
    push:
        branches:
            - master

jobs:
    build:
        runs-on: ubuntu-latest

        steps:
        - name: Checkout repository
          uses: actions/checkout@v2

        - name: Set up Hugo
          uses: peaceiris/actions-hugo@v2
          with:
            hugo-version: 'latest'
        - name: Run deploy.sh
          run: ./deploy.sh