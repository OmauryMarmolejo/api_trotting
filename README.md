# Rails API Throttling and Batch Requests Practice

This project demonstrates the implementation of API Throttling and Batch Requests in a client-server setup using Rails 7.1. The server side utilizes the Rack Attack gem to manage request rates, ensuring efficient and fair use of resources. This README provides an overview of the project setup, configuration, and usage.

## Overview

### API Throttling

API Throttling is a technique used to control the amount of incoming requests to a server within a given timeframe. This is crucial for maintaining the server's reliability, preventing overload, and ensuring equitable access to resources for all users.

### Batch Requests

Batch Requests allow multiple API calls to be grouped into a single request. This reduces the overhead of multiple round-trips between the client and server, enhancing the efficiency of data exchange.

### Rack Attack

Rack Attack is a middleware for Ruby on Rails applications that provides a flexible way to throttle and block potentially harmful requests. It allows defining custom rules to limit request rates based on various criteria such as IP addresses, request paths, and more.

## Project Structure

The project is divided into two main components:

- **Client**: A Rails 7.1 application that makes API calls to the server.
- **Server**: A Rails 7.1 application that serves API requests. It uses Rack Attack to throttle incoming requests to prevent abuse and ensure fair usage.

## Setup and Configuration

### Prerequisites

- Ruby on Rails 7.1
- Bundler

### Installation

1. Clone the repository to your local machine.
2. Navigate to both the client and server directories and run `bundle install` to install dependencies.

### Server Configuration

The server application is configured with Rack Attack to throttle requests. The configuration can be found in `config/initializers/rack_attack.rb`.

```ruby
class Rack::Attack
  throttle('requests by ip', limit: 5, period: 5) do |request|
    puts("request.ip: #{request.ip}")
    request.ip
  end
end

Rails.application.config.middleware.use Rack::Attack
```

This configuration limits requests to 5 per IP every 5 seconds. Adjust the limit and period values as necessary to fit your requirements.

### Running the Applications

    - Start the server application by navigating to the server directory and running rails s.
    - Start the client application by navigating to the client directory and running rails s -p 3001 to avoid port conflicts.

### Making Requests

With both applications running, the client can make API calls to the server. If the number of requests exceeds the throttle limit set in Rack Attack, the server will respond with a 429 Too Many Requests status.

###Contributing

Contributions to this project are welcome. Please fork the repository, make your changes, and submit a pull request.

### License

This project is open-sourced under the MIT License.

Feel free to customize this template to fit your project's specific details, such as how to use the client to make batch requests, additional server endpoints, and any other unique features or configurations your project includes.
