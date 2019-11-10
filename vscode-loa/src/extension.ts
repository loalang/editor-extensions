import { ExtensionContext, workspace } from "vscode";
import {
  LanguageClient,
  LanguageClientOptions,
  ServerOptions,
  TransportKind
} from "vscode-languageclient";

export function activate(context: ExtensionContext) {
  const executable = workspace.getConfiguration().get<string>("loa.bin");
  const serverOptions: ServerOptions = {
    command: executable,
    args: ["server"],
    transport: TransportKind.stdio
  };

  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: "file", language: "loa" }]
  };

  const disposable = new LanguageClient(
    "loa",
    "Loa Language Server",
    serverOptions,
    clientOptions
  ).start();

  context.subscriptions.push(disposable);
}
