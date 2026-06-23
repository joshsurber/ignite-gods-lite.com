import fs from 'fs';
import path from 'path';

const configPath = path.join(process.cwd(), 'dist', 'server', 'wrangler.json');

if (fs.existsSync(configPath)) {
  let fileContent = fs.readFileSync(configPath, 'utf8');
  // Wipe out the conflicting pages binding block entirely
  fileContent = fileContent.replace(
    /"assets":\s*\{\s*"binding":\s*"ASSETS"\s*\},\s*/g,
    ''
  );
  fs.writeFileSync(configPath, fileContent, 'utf8');
  console.log('✅ Reserved ASSETS string safely patched!');
}
