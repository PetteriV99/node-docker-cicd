# We pull frontend image from our repository
FROM private-repository:5050/our-project/frontend-image:latest AS f

# As we have two different entrypoints, we will use this base to do common steps first
FROM node:16 as base
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build
# We copy a folder from frontend image, this contains a React frontend
COPY --from=f /app/build ./back-build/client-build
# As our backend has some email templates that typescript won't obviously build, we will copy them
COPY ./src/templates ./back-build/templates

# Used in production
FROM base as prod
RUN rm -rf ./back-build/test
CMD ["node", "back-build/index.js"]

# This is the entrypoint for any other branch than production
FROM base as test
RUN rm -rf ./back-build/test
CMD ["npm", "run", "ci-test"]
