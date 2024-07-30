   # Use the official Rust image as the base image
   FROM rust:1.67 as builder

   # Create app directory
   WORKDIR /usr/src/app

   # Copy the Cargo.toml and Cargo.lock files
   COPY Cargo.toml Cargo.lock ./

   # Copy the source code
   COPY src ./src
   COPY migrations ./migrations

   # Build the application
   RUN cargo build --release

   # Final stage
   FROM debian:buster-slim

   # Install SQLite
   RUN apt-get update && apt-get install -y libsqlite3-0 && rm -rf /var/lib/apt/lists/*

   WORKDIR /usr/src/app

   # Copy the built executable from the builder stage
   COPY --from=builder /usr/src/app/target/release/chat_server .

   # Copy the .env file and migrations
   COPY .env .
   COPY migrations ./migrations

   # Expose the port your chat server listens on
   EXPOSE 8080

   # Create a volume for the SQLite database
   VOLUME /usr/src/app/data

   # Run the chat server
   CMD ["./chat_server"]
