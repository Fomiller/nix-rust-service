# GENERATED FILE — managed by the fomiller platform flake.
# Do not edit manually: changes will be overwritten by `nix run .#generate`.
# To customize, edit repo.nix in this repository instead.

FROM rust:1.82 AS build
WORKDIR /src
COPY . .
RUN cargo build --release

FROM gcr.io/distroless/cc-debian12
COPY --from=build /src/target/release/app /app
ENTRYPOINT ["/app"]

