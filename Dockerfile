# The most minimumalistic dockerfile possible.
#  No embedded python support, no unit-testing, no aliases.
ARG IMAGE=intersystemsdc/iris-community:2025.3-zpm
FROM $IMAGE

WORKDIR /home/irisowner/dev

COPY ./web /home/irisowner/web

RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly
