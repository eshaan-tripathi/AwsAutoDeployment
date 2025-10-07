export async function handler(event) {
  console.log("Event receivedd:", event);

  // Example logic
  return {
    success: false,
    message: "Lambda executed successfully!",
    input: event,
  };
}
