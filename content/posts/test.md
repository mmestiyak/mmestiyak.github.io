---
title: "From Tally to Binary: Mastering How Machines Deal with Data for Better Development"
date: "2019-03-11"
# description: "Elevate your software engineering skills by mastering data representation, from ancient tally marks to modern binary systems, with insights tailored for Node.js development."
tags: ["nodejs", "binary"]
categories: ["nodejs"]
series: ["Node JS"]
cover:
  image: images/tally-to-binary.webp
  caption: ""
ShowToc: true
TocOpen: true
math: true
draft: true
---


## Introduction

To become a top-notch software developer, you’ve got to get **really good** at understanding data. Why? Well, everything we work with, be it text, numbers, user interfaces, videos, audio—at its core, it’s all just **data**. And when it comes to computers and other electronic devices, **binary** is the language they speak.

Think about it: the internet you’re using right now, the words you're reading on this screen, the videos you binge on YouTube, or the songs you stream on Spotify—all of that is stored and processed using **0s and 1s**. *Simple, right?* But there’s some real magic in how it all works.

**Binary**, also known as **base 2**, is like the simpler sibling of our everyday decimal system, or **base 10** (you know, the one with numbers 0 to 9). In binary, you only have two digits: `0` and `1`. And there’s a pretty good reason for this: *transistors*—the tiny switches inside your computer’s chips—are either **on** (`1`) or **off** (`0`). *That’s it. That’s the whole game.*

In this article, we’ll break down number systems, dive into binary, and set you up to handle data more effectively in **Node.js**. Whether it’s *Buffers* or *Streams*, understanding how data is represented is going to make you a **way better developer**. Let’s get into it!

---

## A Brief History of Counting: From Tally Marks to Binary

Now, get ready for a quick time travel adventure! Imagine going back hundreds of years. Picture an old shepherd counting his sheep. To keep track of how many sheep he took to the field in the morning and how many he brought back home in the evening, he’d use stones. If he had two sheep, he’d set aside two stones. This is how early counting began—simple and practical.

As time went on, people adopted the **tally system**. This method used lines to represent numbers: four apples would be marked as `| | | |`. When they reached five, they’d draw a diagonal line across the four, creating a group of five. Cave walls, bones, wood, or stone were used for carving tally marks.

![tally system representation](/assets/images/tallytable.webp)

But let’s say you needed to count to a million. Writing all those tally marks would take weeks! And even if you managed to write them, imagine trying to read and understand that enormous collection of lines. Pretty crazy, right? But this is how our counting systems evolved over time. Fascinating, isn’t it?

### The Decimal System (Base 10)

- Humans adopted base 10, likely due to having ten fingers.
- Made arithmetic and counting simpler and more manageable.
- Became the standard for everyday use.

As early civilizations grew, they got creative with numbers. The Ancient Egyptians, for example, came up with some pretty cool symbols—a coiled rope for 100 and a water lily for 1000. But here’s the thing: counting goes on forever, so imagine the nightmare of needing a unique symbol for every single number. That would get out of hand real fast!

Then came the brilliant idea of positional notation. With this system, numbers got a serious upgrade: by simply shifting the position of a few symbols, you could represent any number.

Enter the **decimal positional system**, or base 10, which uses just ten symbols—0 through 9. It's called base 10 because each position represents a power of 10. For example, the rightmost position corresponds to $10^0$, the next one to $10^1$, and so on. When you reach 10, the numbers roll over, meaning you increment the left position and reset the right position to 0. This clever system allows us to represent larger numbers without needing new symbols, making counting and calculations super efficient and user-friendly!



#### Example: Breaking Down the Number 319 in Base 10

| Base 10 Number         | 3                     | 1                     | 9                     |
|------------------------|-----------------------|-----------------------|-----------------------|
| Position/Index         | 2                     | 1                     | 0                     |
| Representation         | $3 \times 10^2$      | $1 \times 10^1$      | $9 \times 10^0$      |
|                        |                       |                       |                       |
| **Sum:**               |                       |                       | $\longrightarrow \quad 9 + 10 + 300 = 319$

We can take any number as a base—like binary, which is base 2, or hexadecimal, which is base 16. In positional notation, we start counting from the right to the left, where the rightmost position starts at zero. Each digit is multiplied by the base raised to the power of its index, giving greater weight to the digits on the left. Then we sum these values to see the total value represented by the number.

So, the next time you count to ten, remember that with our ten fingers, we’re naturally inclined to use base 10. Who knew counting could be such a fun finger exercise?


## Enough History! Let’s Dive Back into Binary (Base 2)

Now that we've explored some background, let’s focus on binary and specifically address **why binary?** As we know, with positional notation, we can create any number system with a given base. For computers, we created binary, which uses base 2 and consists of just 0 and 1. This choice minimizes variation and aligns perfectly with how logic gates and hardware process programs and store data using two relatable states.



 **The Role of Transistors**

At the heart of your computer lies the **transistor**, a tiny yet powerful switch that can be either **on (1)** or **off (0)**. These transistors are the building blocks of modern electronics, and their simplicity makes them ideal for storing binary data. Imagine the **Apple M1 chip**, which boasts an astounding **16 billion transistors**! Each one operates using binary, enabling complex calculations and processes.

 **The Magic of Hard Drives**

But the magic doesn’t stop at transistors. Consider the **hard drive**, where the wonders of physical storage come to life. Hard drives use **magnetic mechanisms** to write and read data. As the drive spins, it creates tiny magnetic patterns on its surface, resembling black and white scratches. These patterns represent binary states—magnetized areas signify a **1**, while demagnetized areas represent a **0**. When reading from the disk, a magnetic sensor detects these patterns, converting them back into binary data.

 **Binary in Audio**

Now, think about audio. Each nanosecond, sound waves are recorded as frequencies, which are then converted to binary. This sequence of binary numbers, when played back, vibrates the speaker to recreate the beautiful music and captivating dialogue of your favorite shows.

 **Wireless Data Transfer**

And let’s not forget about wireless data transfer, like Wi-Fi and Bluetooth. These technologies use radio waves to send information back and forth. It’s pretty cool how they take those waves and create variations that represent our binary data—kind of like a secret code! So when you’re streaming your favorite show or chatting with a friend, these systems are busy reading those signals and translating them into the digital information we rely on every day, making everything run smoothly.

 **Pixels in Images and Videos**

Now, let’s talk about images and videos. Every picture you see on your screen and every video you watch is made up of tiny units called **pixels**. Each pixel contains information that represents a color, which is ultimately stored in binary. The colors are often defined by combinations of red, green, and blue (RGB) values, which are all represented as binary numbers. Each pixel's data is stored in memory as a binary sequence that describes how much red, green, and blue to apply to that pixel to achieve the perfect color. This information is then sent to the driver, which displays the corresponding color in the pixel on your screen. When these pixels come together, they create the images and videos that make your digital experience so vibrant and engaging!

So now, I believe you understand why binary is chosen as the fundamental language of computers. In every modern technology you encounter, binary is at its core, serving as the common language that makes it all possible. From storage to sound to wireless connectivity and fiber optics, understanding binary reveals the magic behind the technology we use every day!


## Binary in Action
- **What is Binary?**:
  - Explain how binary is a base-2 number system using only 0 and 1.
  - Example: How `1011` translates to decimal (11 in base 10).

- **How Machines Use Binary**:
  - Mention how transistors in hardware use binary states to process information.
  - Discuss how binary data translates into real-world applications like text encoding (ASCII), image representation (pixels), etc.

- **Comparison with the Decimal System**:
  - Highlight the differences between base 10 and base 2.
  - Explain why humans are comfortable with base 10 and why machines prefer binary.

---

## Real-World Applications of Binary Data
- **Memory and Storage**:
  - How data is stored using bits and bytes in devices like RAM, hard drives, and SSDs.
  - Mention the concept of a byte (8 bits) and how it represents 256 values.

- **Audio and Video**:
  - How sound waves are converted into digital binary data.
  - Explain how video frames are encoded in binary for display.

- **Screens and Displays**:
  - How screens use binary to display images and text.
  - Mention pixel representation and how colors are encoded.

---

## Why This Matters for Developers
- Understanding binary data helps developers optimize performance when working with Buffers and Streams.
- Mention how Node.js handles binary data efficiently, and preview that upcoming posts will cover these topics in detail.

---

## Conclusion
- Summarize the journey from ancient counting methods to modern binary systems.
- Reinforce the importance of mastering data concepts to become a better developer.

---

## Next in the Series
- Tease what’s coming next: diving deeper into Buffers, Streams, and practical data handling in Node.js.
