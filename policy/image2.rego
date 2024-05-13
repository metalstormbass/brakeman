package main

# Identify all `FROM` statements that do not match the allowed pattern
deny[message] {
    some i
    instruction := input[i]
    instruction.Cmd == "from"  # Ensure this is a FROM instruction

    # The `Value` is an array; extract the first element
    image := instruction.Value[0]
    not startswith(image, "cgr.dev/chainguard/")

    message := sprintf("Invalid base image '%s' specified in the FROM statement", [image])
}
