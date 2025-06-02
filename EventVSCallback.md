## 🔁 Roblox Remote Communication Cheat Sheet

### 📡 RemoteEvent
- **Type:** Event  
- **Waits for return?** ❌ No  
- **Blocking?** ❌ No  
- **Triggers multiple listeners?** ✅ Yes  
- **Use for:** Notifications, actions, signals  
- **Fire methods:**
  - `:FireServer(...)`
  - `:FireClient(player, ...)`
  - `:FireAllClients(...)`

---

### 🧠 RemoteFunction
- **Type:** Callback  
- **Waits for return?** ✅ Yes  
- **Blocking?** ✅ Yes  
- **Triggers multiple listeners?** ❌ No (only one `OnServerInvoke` or `OnClientInvoke`)  
- **Use for:** Getting values, confirmations, sync logic  
- **Call methods:**
  - `:InvokeServer(...)`
  - `:InvokeClient(player, ...)`

---

> ✅ **Rule of Thumb**  
> Use `RemoteEvent` when you want to say: “**Hey, do this!**”  
> Use `RemoteFunction` when you want to say: “**Hey, give me this!**”
