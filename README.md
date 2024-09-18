# How to use

## Run Container

```bash
cd path-to-this-repo
docker build . -t simple-playwright-sandbox:latest
docker run --rm -it -v $(pwd):/app simple-playwright-sandbox
```

in Mac, This warning has occurred

```bash
WARNING: The requested image's platform (linux/amd64) does not match the detected host platform (linux/arm64/v8) and no specific platform was requested
```

## Run Playwright test

```bash
npm ci
npx playwright test
```
