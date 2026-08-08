const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

const distDir = path.join(__dirname, "dist");
fs.rmSync(distDir, { recursive: true, force: true });
fs.mkdirSync(distDir);

execSync(`elm make src/Main.elm --output=${path.join(distDir, "elm.js")} --optimize`, {
  stdio: "inherit",
});

const elmJs = fs.readFileSync(path.join(distDir, "elm.js"), "utf8");
const template = fs.readFileSync(path.join(__dirname, "index-template.html"), "utf8");
const [before, after] = template.split("__ELM_JS__");
fs.writeFileSync(path.join(distDir, "index.html"), before + elmJs + after);
fs.rmSync(path.join(distDir, "elm.js"));

fs.cpSync(path.join(__dirname, "rsrc"), path.join(distDir, "rsrc"), { recursive: true });

console.log("Built to " + distDir);
