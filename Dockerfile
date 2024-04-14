FROM rust:1.70.0-alpine3.18 as builder
RUN apk add --no-cache musl-dev

WORKDIR /usr/src/rust-proj
COPY . .
RUN cargo build --release

FROM alpine:3.18.0
COPY --from=builder /usr/src/rust-proj/target/release/rust-proj /
CMD ["./rust-proj"]
