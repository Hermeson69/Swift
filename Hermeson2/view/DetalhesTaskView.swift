import SwiftUI

struct DetalhesTaskView: View {
    
    @Binding var task: Task
    var deleteTask: () -> Void
    
    var body: some View {
        Form {
            Section(header: Text("Detalhes da Tarefa")) {
                Text(task.title)
                    .font(.headline)
                
                Text(task.description)
                    .font(.body)
                
                HStack(alignment: .top) {
                    Spacer()
                    Text("Criada em:")
                        .font(.caption)
                    Text(task.date, style: .date)
                }
            }
            
            Section {
                Toggle("Finalizada?", isOn: $task.pronta)
                
                Button(action: deleteTask) {
                    Text("Deletar tarefa")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Detalhes da Tarefa")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetalhesTaskView_Previews: PreviewProvider {
    static var previews: some View {
        // Creating a mock Task with a description
        let mockTask = Task(id: UUID(), title: "Reunião", description: "Participar da reunião de equipe", date: Date())
        return NavigationStack {
            DetalhesTaskView(task: .constant(mockTask), deleteTask: {
                print("Tarefa deletada")
            })
        }
    }
}
