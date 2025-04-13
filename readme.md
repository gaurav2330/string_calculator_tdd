# String Calculator TDD Kata

## Overview

This project implements the **String Calculator Kata** using **Test-Driven Development (TDD)** principles. The implementation adheres to clean coding practices, focusing on incremental development and frequent refactoring.

---

## Problem Statement

Create a `StringCalculator` class with the following functionality:
1. Add a string of comma-separated numbers and return their sum.
2. Handle edge cases such as:
   - Empty strings (return `0`).
   - Support custom delimiters.
   - Ignore numbers greater than `1000`.
   - Handle multiple delimiters of varying lengths.
   - Throw an exception for negative numbers, listing all negatives in the error message.

---

## Technologies Used

- **Language**: Ruby
- **Testing Framework**: RSpec

---

## Getting Started

### Prerequisites
Ensure you have the following installed:
- Ruby (v2.7+)
- Bundler

### Installation
1. Clone the repository:
   ```bash
   git clone [repo-link]
   cd string_calculator
