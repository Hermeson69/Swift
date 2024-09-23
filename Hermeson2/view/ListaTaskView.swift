import SwiftUI

struct ListaTaskView: View {
    
    @Binding var tasks: [Task]
    @State private var adicionandoTarefa = false
    @State private var nomeNovaTarefa = ""
    @State private var descricaoNovaTarefa = ""
    
    let json = JSONService()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($tasks) { $task in
                    NavigationLink(destination: DetalhesTaskView(task: $task, deleteTask: {
                        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                            tasks.remove(at: index)
                            saveJson()
                        }
                    })) {
                        Text(task.title)
                    }
                }
                .onDelete { indexSet in
                    tasks.remove(atOffsets: indexSet)
                    saveJson()
                }
            }
            .navigationTitle("Lista de Tarefas")
            .toolbar {
                Button {
                    adicionandoTarefa = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $adicionandoTarefa) {
                VStack {
                    TextField("Nome da tarefa", text: $nomeNovaTarefa)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    TextField("Descrição da tarefa", text: $descricaoNovaTarefa)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button {
                        if !nomeNovaTarefa.isEmpty {
                            tasks.append(Task(title: nomeNovaTarefa, description: descricaoNovaTarefa))
                            nomeNovaTarefa = ""
                            descricaoNovaTarefa = ""
                            adicionandoTarefa = false
                            saveJson()
                        }
                    } label: {
                        Text("Adicionar")
                    }
                }
                .padding()
            }
        }
    }
    
    func initTests() {
        tasks = [
            Task(title: "Comprar pão", description: ""),
            Task(title: "Comprar pão", description: ""),
            Task(title: "Comprar pão", description: ""),
            Task(title: "Comprar pão", description: "")
        ]
    }
    
    func loadJson() {
        do {
            tasks = try json.load() ?? []
        } catch {
            print("Failed to load JSON: \(error)")
        }
    }
    
    func saveJson() {
        do {
            try json.save(tasks)
        } catch {
            print("Failed to save JSON: \(error)")
        }
    }
    
    func deleteJson() {
        do {
            try json.delete()
        } catch {
            print("Failed to delete JSON: \(error)")
        }
    }
}

