FROM ghcr.io/evanrichter/cargo-fuzz as builder

ADD . /gzp
WORKDIR /gzp/fuzz
RUN cargo +nightly fuzz build 

FROM debian:bookworm
COPY --from=builder /gzp/fuzz/target/x86_64-unknown-linux-gnu/release/gzp-fuzz /