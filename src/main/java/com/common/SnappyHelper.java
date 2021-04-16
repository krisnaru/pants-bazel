package com.common;

import org.xerial.snappy.Snappy;

import java.io.IOException;

public class SnappyHelper {
  public static byte[] compressed(String input) throws IOException {
    return Snappy.compress(input.getBytes("UTF-8"));
  }

  public static byte[] compressed(byte[] input) throws IOException {
    return Snappy.compress(input);
  }

  public static byte[] decompressed(byte[] compressed) throws IOException {
    return Snappy.uncompress(compressed);
  }
}
