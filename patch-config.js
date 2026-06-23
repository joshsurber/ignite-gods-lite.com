import fs from 'fs';
import path from 'path';

const serverDir = path.join(process.cwd(), 'dist', 'server');
const jsonPath = path.join(serverDir, 'wrangler.json');
const tomlPath = path.join(serverDir, 'wrangler.toml');

// 1. Check and patch wrangler.json if it exists
if (fs.existsSync(jsonPath)) {
  let content = fs.readFileSync(jsonPath, 'utf8');
  content = content.replace(
    /"assets":\s*\{\s*"binding":\s*"ASSETS"\s*\},\s*/g,
    ''
  );
  fs.writeFileSync(jsonPath, content, 'utf8');
  console.log('✅ Generated wrangler.json safely patched!');
}

// 2. Check and patch wrangler.toml if it exists
if (fs.existsSync(tomlPath)) {
  let content = fs.readFileSync(tomlPath, 'utf8');
  content = content.replace(
    /assets\s*=\s*\{\s*binding\s*=\s*"ASSETS"\s*\}/g,
    ''
  );
  fs.writeFileSync(tomlPath, content, 'utf8');
  console.log('✅ Generated wrangler.toml safely patched!');
}
