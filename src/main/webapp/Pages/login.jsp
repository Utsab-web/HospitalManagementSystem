<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/output.css">
    <title>Hospital Login</title>
</head>

<body>

<div class="min-h-screen bg-linear-to-br from-cyan-50 to-emerald-100 flex items-center justify-center">

    <div class="w-[90%] md:w-112.5">

        <!-- Heading -->
        <h2 class="text-3xl font-bold text-slate-700 mb-4">
            Login As
        </h2>

        <!-- Main Card -->
        <div class="bg-white border border-emerald-200 rounded-2xl shadow-xl overflow-hidden">

            <!-- Roles -->
            <div class="bg-slate-100 border-b border-emerald-200 p-2">

                <div class="flex gap-2">

                    <button
                            id="doctorBtn"
                            class="role-btn flex-1 py-2 rounded-lg bg-emerald-500 text-white font-semibold transition">

                        Doctor

                    </button>

                    <button
                            id="patientBtn"
                            class="role-btn flex-1 py-2 rounded-lg text-slate-600 transition">

                        Patient

                    </button>

                    <button
                            id="labBtn"
                            class="role-btn flex-1 py-2 rounded-lg text-slate-600  transition">

                        Lab

                    </button>

                    <button
                            id="receptionBtn"
                            class="role-btn flex-1 py-2 rounded-lg text-slate-600  transition">

                        Reception

                    </button>

                    <button
                            id="pharmacistBtn"
                            class="role-btn flex-1 py-2 rounded-lg bg-emerald-500 text-white font-semibold transition">

                        Pharmacy

                    </button>


                </div>

            </div>

            <!-- Login Form -->
            <div class="p-5">

                <form
                        id="loginForm"
                        class="space-y-5">

                    <!-- Username -->
                    <div>

                        <label
                                for="username"
                                class="block text-slate-700 font-semibold mb-2">

                            Username

                        </label>

                        <input
                                id="username"
                                name="username"
                                type="text"
                                placeholder="Enter username"
                                class="w-full border-2 border-emerald-300 rounded-xl px-4 py-3 outline-none focus:border-emerald-500 transition">

                    </div>

                    <!-- Password -->
                    <div>

                        <label
                                for="password"
                                class="block text-slate-700 font-semibold mb-2">

                            Password

                        </label>

                        <div class="relative">

                            <input
                                    id="password"
                                    name="password"
                                    type="password"
                                    placeholder="Enter password"
                                    class="w-full border-2 border-emerald-300 rounded-xl px-4 py-3 pr-12 outline-none focus:border-emerald-500 transition">

                            <button
                                    type="button"
                                    onclick="showPassword()"
                                    class="absolute right-4 top-1/2 -translate-y-1/2">

                                <svg
                                        id="eyeIcon"
                                        class="w-6 h-6"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg">

                                    <path
                                            d="M1 12C1 12 5 4 12 4C19 4 23 12 23 12"
                                            stroke="#334155"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"/>

                                    <path
                                            d="M1 12C1 12 5 20 12 20C19 20 23 12 23 12"
                                            stroke="#334155"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"/>

                                    <circle
                                            cx="12"
                                            cy="12"
                                            r="3"
                                            stroke="#334155"
                                            stroke-width="2"/>

                                    <path
                                            id="slash"
                                            d="M3 3L21 21"
                                            stroke="#334155"
                                            stroke-width="2"
                                            stroke-linecap="round"/>

                                </svg>

                            </button>

                        </div>

                    </div>

                    <!-- Login -->
                    <button
                            id="loginBtn"
                            type="submit"
                            class="w-full bg-emerald-500 active:scale-95 transition text-white font-bold py-3 rounded-xl">

                        Login

                    </button>

                </form>

            </div>

        </div>

    </div>

</div>
</body>
<script>

    let currentRole = "Doctor";

    const roleInput = document.createElement("input");
    roleInput.type = "hidden";
    roleInput.name = "role";
    roleInput.id = "role";
    roleInput.value = currentRole;

    document.getElementById("loginForm").appendChild(roleInput);

    const buttons = document.querySelectorAll(".role-btn");

    buttons.forEach(button => {

        button.addEventListener("click", function () {

            buttons.forEach(btn => {

                btn.classList.remove("bg-emerald-500", "text-white");
                btn.classList.add("text-slate-600");

            });

            this.classList.remove("text-slate-600");
            this.classList.add("bg-emerald-500", "text-white");

            currentRole = this.innerText.trim();

            roleInput.value = currentRole;

        });

    });

    function showPassword() {

        const password = document.getElementById("password");
        const slash = document.getElementById("slash");

        if (password.type === "password") {

            password.type = "text";
            slash.style.display = "none";

        } else {

            password.type = "password";
            slash.style.display = "block";

        }

    }

</script>
</html>