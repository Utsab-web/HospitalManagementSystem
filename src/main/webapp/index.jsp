
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/output.css">
    <title>hospital Management System</title>
  </head>

  <body>

  <!-- Main -->
  <div id="main" class="min-h-screen w-full bg-linear-to-br from-cyan-50 to-emerald-100 flex items-center justify-center">

    <!-- Hero Section -->
    <div class="flex flex-col md:flex-row h-[80%] w-[90%] md:w-[80%] justify-around items-center gap-16">

      <!-- Text Section -->
      <div class="text-2xl md:text-3xl font-bold flex flex-col justify-center text-center md:text-left gap-2">

            <span class="text-5xl md:text-6xl font-extrabold text-emerald-900">
                Welcome
            </span>

        <span class="text-3xl md:text-4xl font-semibold text-slate-700">
                to the Hospital Management System
            </span>

        <p class="text-base md:text-lg font-medium text-slate-600">
          Manage appointments, patient records, doctors, laboratories
          and reception services from one platform.
        </p>

        <div class="flex flex-col justify-center md:justify-around mt-[5%] gap-5">

          <button id="button1" type="button"
                  class="cursor-pointer w-fit text-lg md:text-xl font-bold bg-emerald-500 text-white px-5 py-2 rounded-xl shadow-md active:scale-95 transition"
                  onclick="
                const btn=document.getElementById('button1');
                if(btn.classList.contains('bg-emerald-500')){
                    btn.classList.replace('bg-emerald-500','bg-emerald-300');
                }
                else{
                    btn.classList.replace('bg-emerald-300','bg-emerald-500');
                }">
            New Arrival(Sign Up)
          </button>

          <button  id="button2" type="button"
                   class="cursor-pointer w-fit text-lg md:text-xl font-bold bg-teal-500 text-white px-5 py-2 rounded-xl shadow-md active:scale-95 transition"
                   onclick="
                        gotoLogin();
                const btn=document.getElementById('button2');
                if(btn.classList.contains('bg-teal-500')){
                    btn.classList.replace('bg-teal-500','bg-teal-300');
                }
                else{
                    btn.classList.replace('bg-teal-300','bg-teal-500');
                }">
            Login
          </button>

        </div>

      </div>

      <!-- Image Section -->
      <div class="flex justify-center items-center">

        <img class="h-auto w-[90%] sm:w-[80%] md:w-[95%] max-w-2xl" src="Images/hospital.png" alt="hospital">

      </div>

    </div>

  </div>

  <script>
    function gotoLogin(){

      setTimeout(() => {
        window.location.href = "Pages/login.jsp";
      }, 500);
    }
  </script>
  </body>
</html>


