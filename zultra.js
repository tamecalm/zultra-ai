#!/usr/bin/env node

import { spawn } from 'child_process';
import { fileURLToPath } from 'url';
import path from 'path';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

function detectPlatform() {
  const platform = process.platform;
  const arch = process.arch;

  const platformMap = {
    win32: 'win32',
    darwin: 'darwin',
    linux: 'linux'
  };

  const archMap = {
    x64: 'x64',
    arm64: 'arm64'
  };

  const mappedPlatform = platformMap[platform];
  const mappedArch = archMap[arch];

  if (!mappedPlatform || !mappedArch) {
    console.error(`Unsupported platform: ${platform}-${arch}`);
    process.exit(1);
  }

  return `${mappedArch}-${mappedPlatform}`;
}

function getBinaryPath() {
  const platformArch = detectPlatform();
  const binaryName = process.platform === 'win32' ? 'zultra.exe' : 'zultra';
  const binaryPath = path.join(__dirname, 'zultra', platformArch, binaryName);

  if (!fs.existsSync(binaryPath)) {
    console.error(`Binary not found for ${platformArch}: ${binaryPath}`);
    console.error('Please ensure the package is properly installed.');
    process.exit(1);
  }

  return binaryPath;
}

function runBinary() {
  const binaryPath = getBinaryPath();
  const args = process.argv.slice(2);

  const child = spawn(binaryPath, args, {
    stdio: 'inherit',
    shell: false
  });

  child.on('error', (error) => {
    console.error(`Failed to start zultra: ${error.message}`);
    process.exit(1);
  });

  child.on('exit', (code, signal) => {
    if (signal) {
      process.kill(process.pid, signal);
    } else {
      process.exit(code || 0);
    }
  });
}

runBinary();
